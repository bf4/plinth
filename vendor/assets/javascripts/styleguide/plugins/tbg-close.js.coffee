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
  # ========================= 
  class Close 
    constructor: ( element ) ->
      $el = $(element)
      @$target = @_getTarget $el
  
    _constructor:  Close
  
    close : ->
      if not @$target then return false
      @$target.trigger 'close'
      @$target.remove()

    # private
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
