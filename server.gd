#warning-ignore-all:return_value_discarded
extends Node

var Player = preload("res://game/scene/Player.tscn")
var Map = preload("res://game/scene/Map.tscn")

const SERVER_PORT = 8000
const MAX_PLAYERS = 24
var players_info = {}

func _ready():
    console.info("Lancement du serveur")
    _create_server()

#on demarre le serveur
func _create_server():
    var peer = NetworkedMultiplayerENet.new()
    var error = peer.create_server(SERVER_PORT, MAX_PLAYERS)
    
    match error:
        ERR_CANT_CREATE:
            console.fatal("Echec du demarrage du serveur")
            console.fatal("Verifier que le port d'ecoute n'est pas deja utilisé par une instance ou une autre appli")
        OK:
            get_tree().set_network_peer(peer)
            get_tree().connect("network_peer_connected",    self, "_client_connected"   )
            get_tree().connect("network_peer_disconnected", self, "_client_disconnected")
            console.info("Serveur créer avec succes")

#quand un nouveau joueur arrive
remote func register_player(args):
    console.info("map name : "+ args[1])
    if !$Map.has_node(args[1]):
        enter_to_map(args[1])
    
    console.info(args[0])
    #on recupere l'id du joueur
    var id = get_tree().get_rpc_sender_id()
    #on l'ajoute a l'arbre desRemote_player noeuds
    var newClient = Player.instance()
    newClient.set_name(str(id))     # spawn players with their respective names
    newClient.stat = args[0]
    get_node("Map/" + args[1] + "/Players").add_child(newClient)
    
    #on l'ajoute dans la liste des joueurs
    players_info[id] = args[0]
    #on envoie au nouveau joueur la liste des autres joueurs
    rpc_id(id, "init_players", players_info)
    #on envoie a tout les joueur, les info du nouveau joueur
    rpc("add_player_remote", id, args[0])
    console.info("joueur ajouter: " + str(id))
    
remote func enter_to_map(map_name):
    console.info("enter to map")
    if $Map.has_node(map_name):
        console.info("la map est deja chargé")
    else:
        console.info("ajout d'une nouvelle map au serveur")
        var map = Map.instance()
        map.set_name(map_name)
        $Map.add_child(map)

    
func _client_connected(id):
    console.info("Connexion du joueur "+ str(id))

func _client_disconnected(id):
    console.info("Déconnexion du joueur " + str(id))
    players_info.erase(id)
    #$Map/Players.get_node(str(id)).queue_free()
