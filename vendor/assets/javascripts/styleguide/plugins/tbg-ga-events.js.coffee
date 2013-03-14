# ============================================================
# GAEvents v0.0.0
# http://URL
# ============================================================
# Copyright 2012 The Beans Group
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

plugin = ($)->

  "use strict"

  # GAEVENT CLASS DEFINITION
  #
  # @example How to use with Haml
  #     %a{ :href => '/some/link', :class => 'btn', :data => { :gaevent => 'category|action|opt_label|opt_value|opt_noninteraction' } }
  #     # See: https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide
  #
  # @example How to ensure plugin self initialises on element
  #     <form data-gaevent-load="true"> ... </form>
  #
  class GAEvent

    # Construct a GAEvent instance - split the event content string and pass to sendEvent
    #
    # @param [Object] element HTMLElement
    # @param [String] eventcontent Pipe delimited string of event content
    #
    constructor: ( element, @eventcontent ) ->
      $el = $(element)
      @sendEvent (if typeof eventcontent.split('|') isnt "array" then eventcontent.split('|') else [eventcontent])

    _constructor: GAEvent

    # Send the event to Google Analytics
    #
    # @param [Array] data If Google Analytics _gaq array defined then push data array after inserting '_trackEvent' string at beginning of data array
    #
    sendEvent : (data)->
      data.unshift('_trackEvent')
      _gaq?.push data

  # Remove data and data attributes from jQuery object
  #
  # @param [Object] $el jQuery wrapped HTMLElement from which to remove data
  # @param [String] ev Data string to be removed
  #
  removeData = ( $el, ev )->
    $el.removeAttr('data-' + ev)
    $el.removeData(ev)


  # GAEVENT PLUGIN DEFINITION
  # ==========================

  $.fn.gaEvent = ( option , type = "gaevent") ->
    this.each ->
      $this = $(@)
      $this = if ($t = $(this)).is("[data-#{type}]") then $t else $t.closest("[data-#{type}]")
      data = $this.data 'gaeventplugin'
      if not (eventContent= $this.data type ) then return removeData($this, type)
      if !data then $this.data 'gaeventplugin', (data = new GAEvent @, eventContent)
      if typeof option is 'string' then data[option].call $this

  $.fn.gaEvent.Constructor = GAEvent

  # DATA API
  # ===================================

  # On document ready, delegate a click handler on the body for 'click.gaEvent.data-api'
  #   event with target of '[data-gaevent]' and attach plugin; attach a handler for
  #   'tbgform-success.gaEvent.data-api' event and attach plugin; attach plugin to each
  #   element with '[data-gaevent-load]' attribute
  #
  $ ->

    $('body').on 'click.gaEvent.data-api', '[data-gaevent]' , ( e ) ->
      $this = $(e.target)
      $this.gaEvent()

    $('body').on 'tbgform-success.gaEvent.data-api', (e, $form)->
      $form.gaEvent null, 'gaevent-form'

    # Can't turn this off via the data API
    # @todo Enable Data API ga-event-load method
    $('[data-gaevent-load]').each ->
      $(this).gaEvent null, 'gaevent-load'


do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin)
  else
    # Browser globals
    plugin(jQuery)
