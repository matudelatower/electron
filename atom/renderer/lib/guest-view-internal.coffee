ipc = require 'ipc'
webFrame = require 'web-frame'

requestId = 0

ipc.on 'ATOM_SHELL_WEB_CONTENTS_SET_NAME', (name) ->

module.exports =
  createGuest: (type, params, callback) ->
    requestId++
    ipc.send 'ATOM_SHELL_GUEST_VIEW_MANAGER_CREATE_GUEST', type, params, requestId
    ipc.on "ATOM_SHELL_RESPONSE_#{requestId}", callback

  destroyGuest: (guestInstanceId) ->
    ipc.send 'ATOM_SHELL_GUEST_VIEW_MANAGER_DESTROY_GUEST', guestInstanceId

  setAutoSize: (guestInstanceId, params) ->
    ipc.send 'ATOM_SHELL_GUEST_VIEW_MANAGER_SET_AUTO_SIZE', guestInstanceId, params

  setAllowTransparency: (guestInstanceId, allowtransparency) ->
    ipc.send 'ATOM_SHELL_GUEST_VIEW_MANAGER_SET_ALLOW_TRANSPARENCY', guestInstanceId, allowtransparency
