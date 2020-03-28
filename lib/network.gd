extends Node

"""
rpc('function_name', <optional_args>)
rpc_id(<peer_id>,'function_name', <optional_args>)
rpc_unreliable(function_name', <optional_args>)
rpc_unreliable_id(<peer_id>, 'function_name', <optional_args>)

rset('variable', value)
rset_id(<peer_id>, 'variable', value)
rset_unreliable('variable', value)
rset_unreliable_id(<peer_id>, 'variable', value)
"""

var _meth = []
var _meth_id = []
var _meth_unreliable = []
var _meth_unreliable_id = []

var _value = []
var _value_id = []
var _value_unreliable = []
var _value_unreliable_id = []

var i = 0

func _ready():
    pass # Replace with function body.

func _process(delta):
    i += 1
    if i > 60:
        i = 0
        _send()
    
func _send():
    if _meth.size() > 0:
        for i in _meth:
            _meth[i].node.rpc(_meth[i].method, _meth[i].val)
    if _meth_id.size() > 0:        
        for i in _meth_id:
            _meth_id[i].node.rpc(_meth_id[i].id, _meth_id[i].method, _meth_id[i].val)
    if _meth_unreliable.size() > 0:        
        for i in _meth_unreliable:
            _meth_unreliable[i].node.rpc(_meth_unreliable[i].method, _meth_unreliable[i].val)
    if _meth_unreliable_id.size() > 0:        
        for i in _meth_unreliable_id:
            _meth_unreliable_id[i].node.rpc(_meth_unreliable_id[i].id, _meth_unreliable_id[i].method, _meth_unreliable_id[i].val)
    if _value.size() > 0:
        for i in _value:
            _value[i].node.rpc(_value[i].method, _value[i].val)
    if _value_id.size() > 0:
        for i in _value_id:
            _value_id[i].node.rpc(_value_id[i].id, _value_id[i].method, _value_id[i].val)
    if _value_unreliable.size() > 0:
        for i in _value_unreliable:
            _value_unreliable[i].node.rpc(_value_unreliable[i].method, _value_unreliable[i].val)
    if _value_unreliable_id.size() > 0:
        for i in _value_unreliable_id:
            _value_unreliable_id[i].node.rpc(_value_unreliable_id[i].id, _value_unreliable_id[i].method, _value_unreliable_id[i].val)
        
func meth(node, method, val):
    _meth.append({
        "node": node,
        "method": method,
        "val": val
       })
    
func meth_id(node, id, method, val):
    _meth_id.append({
        "node": node,
        "id": id,
        "method": method,
        "val": val
       })
    
func meth_unreliable(node, method, val):
    _meth_unreliable.append({
        "node": node,
        "method": method,
        "val": val
       })
    
func meth_unreliable_id(node, id, method, val):
    _meth_unreliable_id.append({
        "node": node,
        "id": id,
        "method": method,
        "val": val
       })
    
func value(node, method, val):
    _value.append({
        "node": node,
        "method": method,
        "val": val
       })
    
func value_id(node, id, method, val):
    _value_id.append({
        "node": node,
        "id": id,
        "method": method,
        "val": val
       })
    
func value_unreliable(node, method, val):
    _value_unreliable.append({
        "node": node,
        "method": method,
        "val": val
       })
    
func value_unreliable_id(node, id, method, val):
    _value_unreliable_id.append({
        "node": node,
        "id": id,
        "method": method,
        "val": val
       })
