#= require ../core/i-openable

# Dropdown component
#
# Handles the following:
#
# * Click to toggle the dropdown
# * Clicking anywhere else will close the dropdown
class UI.Dropdown extends UI.iOpenable
  @TAGNAME: 'dropdown'

  # Action event handler
  # @private
  _toggle: ->
    return if @parentNode.hasAttribute('disabled') or @disabled
    @toggle()

  # Action event handler for document
  # @private
  _close: (e)->
    @close() if getParent(e.target, UI.Dropdown.SELECTOR()) isnt @ and e.target isnt @parentNode

  # Runs when the element is inserted into the DOM
  # @private
  onAdded: ->
    super
    @parentNode.addEventListener UI.Events.action, @_toggle.bind(@)

  # Initializes the component
  # @private
  initialize: ->
    super ['top','bottom']
    document.addEventListener UI.Events.action, @_close.bind(@), true