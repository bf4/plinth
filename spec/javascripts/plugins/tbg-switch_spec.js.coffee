#=require plugins//tbg-switch

describe 'Switch:', ->
  activeClass = "is-active"

  beforeEach ->
      loadFixtures "plugins/tbg-switch_fixture"

  describe 'A good jquery plugin', ->
    it 'should exisit', ->
      expect($.fn.switch).toBeDefined()

    it 'should return element', ->
      expect($(document.body).switch()[0]).toEqual document.body

  describe 'Plugin instantiation', ->
    beforeEach ->
      $('#eg1').click()

    it 'should be instatiated on click', ->
      switchLink = $('#eg1')
      inst = switchLink.data 'switchPlugin'

      expect(inst).toBeDefined()
      expect(inst._constructor).toEqual $.fn.switch.Constructor


  describe 'Manage active state by :href and content ID', ->
    beforeEach ->
      $('#eg1').click()

    it "should add an active state to a links parent li when clicked", ->
      $parentTrue = $('#eg1').parent 'li'
      expect($parentTrue.hasClass(activeClass)).toBeTruthy()

      $parentFalse = $('#eg2').parent 'li'
      expect($parentFalse.hasClass(activeClass)).toBeFalsy()

    it "should add an active state to a links coresponding content when clicked", ->
      $content = $('#target1')
      expect($content.hasClass(activeClass)).toBeTruthy()

      $contentFalse = $('#target2')
      expect($contentFalse.hasClass(activeClass)).toBeFalsy()

  describe 'a switch toggling state', ->
    it "accepts an option to toggle state", ->
      el = $('#eg0')
      el.attr('data-switch-toggle', true)
      el.click()
      expect(el.data('switchPlugin').toggle).toBeTruthy()

      elFalse = $('#eg1')
      elFalse.click()
      expect(elFalse.data('switchPlugin').toggle).toBeFalsy()

    it "toggles active state if toggle is set", ->
      el = $('#eg0')
      parent = el.parent 'li'
      el.attr('data-switch-toggle', true)
      el.click()
      expect(parent.hasClass(activeClass)).toBeTruthy()
      el.click()
      expect(parent.hasClass(activeClass)).toBeFalsy()

    it "active state stays on if toggle IS NOT set", ->
      el = $('#eg1')
      parent = el.parent 'li'
      el.click()
      expect(parent.hasClass(activeClass)).toBeTruthy()
      el.click()
      expect(parent.hasClass(activeClass)).toBeTruthy()



  describe 'Group state managment', ->
    it "hides other elements in the group when clicked", ->
      $('#eg1-2').click()
      $parent1 = $('#eg1-2').parent 'li'
      expect($parent1.hasClass(activeClass)).toBeTruthy()

      $('#eg2-2').click()
      $parent2 = $('#eg2-2').parent 'li'
      expect($parent2.hasClass(activeClass)).toBeTruthy()

      expect($parent1.hasClass(activeClass)).toBeFalsy()
