#          _              _            _   _
#         /\ \           /\ \         /\_\/\_\ _
#        /  \ \         /  \ \       / / / / //\_\
#       / /\ \_\       / /\ \ \     /\ \/ \ \/ / /
#      / / /\/_/      / / /\ \ \   /  \____\__/ /
#     / / / ______   / / /  \ \_\ / /\/________/
#    / / / /\_____\ / / /   / / // / /\/_// / /
#   / / /  \/____ // / /   / / // / /    / / /
#  / / /_____/ / // / /___/ / // / /    / / /
# / / /______\/ // / /____\/ / \/_/    / / /
# \/___________/ \/_________/          \/_/

module.exports = (hooks={}) ->

  $ = (tag, attributes, children, rest...) ->
    hook = hooks[tag]
    if hook
      return hook.apply $, [attributes, children, rest...]
    return new Node tag, attributes, children

  $.registerHook = (tag, cb) ->
    hooks[tag] = cb

  $.notAttr = ['children','data']
  $.emptyTags = ['br','hr','meta','link','base','img','embed','param','area','col','input']

  require('./mixins/helpers')($)
  require('./mixins/render')($)
  require('./mixins/transform')($)

  Node = require './node'

  return $
