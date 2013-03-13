# ============================================================
# Forms v0.0.1
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

  # FORM CLASS DEFINITION
  # 
  # @example How to use the class
  #     formInstance = new TBGForm $('.my-element')
  #     # Send form
  #     formInstance.send()
  #
  # @example How to use the class with jQuery
  #     $('.my-element').send()
  #
  # @example How to ensure plugin self initialises on element
  #     <form data-forms="/endpoint"> ... </form>
  #
  class TBGForm

    # Construct a new TBGForm instance
    #
    # @param [Object] element form we will attach the TBGForm to
    #
    constructor: ( element ) ->
      @form = $(element)
      @send()

    _constructor: TBGForm

    # Send the form, calls sendRequest passing form data and url to post to
    #
    send : ->
      if not (url = @form.data('forms') || @form.attr('action')) then return false
      @sendRequest @form.serialize(), url

    # Execute ajax post
    #
    # @param [Object] object JSON serialised form data
    # @param [String] string URL to post form to
    #
    sendRequest : (data, url)->
      $.ajax
        type: 'POST'
        url: url
        data: data
        dataType: "json"
        success: (successData)=>
          @showSuccess(successData)
        error: (err) =>
          @showErrors $.parseJSON(err.responseText)

    # Handle form post errors - callback from sendRequest
    # 
    # Clear previous errors, add error classes to relevent fields and labels and add error message summary
    #
    # @param [Object] object JSON errors object
    #
    showErrors :( errors )->
      @form.find('.form-msg.is-error').remove()
      @form.find('.is-error').removeClass('is-error')

      for field, error of errors
        $this = @form.find("[id$=#{field}]").addClass('is-error')
        if not msg = ($this.siblings(".form-msg"))[0] then msg = $("<small class='form-msg'></small>").insertAfter($this)
        msg.text( "#{field} " + error.join(' & ') ).addClass('is-error')
        $this.siblings('label').addClass('is-error')

    # Handle form post success - callback from sendRequest
    # 
    # Pass empty error object to showErrors; if Handlebars defined
    #   call _showSuccessTemplated with data object otherwise call
    #   _showSuccessPlain; trigger 'tbgform-success' event with form data; fade form if necessary
    #
    # @param [Object] object JSON data object from ajax post
    #
    showSuccess: (data)->
      @showErrors {}
      if Handlebars?
        @_showSuccessTemplated data
      else
        @_showSuccessPlain()
      $('body').trigger 'tbgform-success', [@form]
      if @form.data 'formsSuccessFormfade' then @form.fadeOut()

    # Display compiled success template
    #
    # Compile template from data-formsSuccessContent; display with data object
    # 
    # @private
    # @param [Object] object JSON data object from showSuccess
    #
    _showSuccessTemplated: (data)->
      template = Handlebars.compile @form.data('formsSuccessContent')
      successArea = $(@form.data 'formsSuccessReplace')
      successArea.fadeOut().html( template(data) ).fadeIn()

    # Display success with replaced content
    #
    # Display data-formsSuccessContent HTML
    #
    # @private
    # 
    _showSuccessPlain: ->
      @successArea = $(@form.data 'formsSuccessReplace')
      @successHTML = @form.data 'formsSuccessContent'
      @successArea.fadeOut().html(@successHTML).fadeIn()




  # DOWNLOADFORM PLUGIN DEFINITION
  # ==========================

  $.fn.forms = ( option ) ->
    this.each ->
      $this = $(@)
      data = $this.data 'formsPlugin'
      if !data then $this.data 'formsPlugin', (data = new TBGForm @) else data[option]()

  $.fn.forms.Constructor = TBGForm


  # DATA API
  # ===================================

  $ ->
    $('body').on 'submit.forms.data-api', '[data-forms]' , ( e ) ->
      $(e.target).forms('send')
      return false

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
