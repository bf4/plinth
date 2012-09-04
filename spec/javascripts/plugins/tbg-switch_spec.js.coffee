#=require plugins//tbg-switch

describe 'Switch:', ->
  beforeEach ->
      loadFixtures "plugins/tbg-switch_fixture"


  describe 'A good jquery plugin', ->
    it 'should exisit', ->
      expect($.fn.switch).toBeDefined()

    it 'should return element', ->
      expect($(document.body).switch()[0]).toEqual(document.body)


  describe 'Plugin instantiation', ->
    beforeEach ->
      $('[data-switch]').first().click()

    it 'should be instatiated on click', ->
      switchLink = $('[data-switch]').first()
      inst = switchLink.data('switchPlugin')
      expect(inst).toBeDefined()
      expect(inst._constructor).toEqual($.fn.switch.Constructor)
