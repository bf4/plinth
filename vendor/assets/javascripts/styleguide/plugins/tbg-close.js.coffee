# ============================================================
# TBG close v0.0.1
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

  # CLOSE CLASS DEFINITION
  # 
  # @example How to use the class
  #     closeInstance = new Close $('.my-element')
  #     # Close element
  #     closeInstance.close()
  #
  # @example How to use the class with jQuery
  #     $('.my-element').close('close')
  #
  # @example How to ensure plugin self initialises on element
  #     <div data-close> Close me </div>
  #
  class Close

    # Construct a new Close instance
    #
    # @param [Object] element HTMLElement on which we will try to close
    #
    constructor: ( element ) ->
      $el = $(element)
      @$target = @_getTarget $el
  
    # Expose the Class 
    _constructor:  Close
    
    # Close the element - Triggers 'close' event on this.$target then removes this.$target
    #
    close : ->
      if not @$target then return false
      @$target.trigger 'close'
      @$target.remove()

    # Get the target element to be closed
    #
    # @private
    # @param [Object] $el jQuery wrapped HTMLElement to get target to be closed from
    # @return [Object] jQuery wrapped HTMLElement to be closed
    #
    _getTarget: ($el) ->
      # Get target from data element
      target = (dataEl = $( $el.attr('data-close') )).length && dataEl
      # else get from href
      if not target then target = (dataEl = $( $el.attr('href') )).length && dataEl
      target
  
  # CLOSE PLUGIN DEFINITION
  # ==========================
  
  $.fn.close = ( option ) ->
    this.each ->
      $this = $(@)
      data = $this.data 'closePlugin'
      if !data then $this.data 'closePlugin', (data = new Close @)
      if typeof option is 'string' then data[option]()

  $.fn.close.Constructor = Close
  
  
  # DATA API
  # ===================================
  
  $ ->
    $('body').on 'click.close.data-api', '[data-close]', ( e ) ->
      $(e.target).close('close')
      e.preventDefault()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
