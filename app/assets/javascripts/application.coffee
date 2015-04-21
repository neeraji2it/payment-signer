//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require gritter
//= require signature-pad
//= require bootstrap-datepicker


$ ->
  $('.datepicker').datepicker format: 'yyyy-mm-dd'

$ ->
  signatureOptions = 
    drawOnly: true
    lineMargin: 0
    lineTop: 140
    penColour: '#2D2D2D'

  mySignaturePad = $('#new_sign')

  clearSignatureOnShake = ->
    if confirm('Clear Signature?')
      mySignaturePad.signaturePad().clearCanvas()
    return

  mySignaturePad.signaturePad signatureOptions
  if typeof window.DeviceMotionEvent != 'undefined'
    # Shake sensitivity (a lower number is more)
    sensitivity = 35
    # Position variables
    x1 = 0
    y1 = 0
    z1 = 0
    x2 = 0
    y2 = 0
    z2 = 0
    # Listen to motion events and update the position
    window.addEventListener 'devicemotion', ((e) ->
      x1 = e.accelerationIncludingGravity.x
      y1 = e.accelerationIncludingGravity.y
      z1 = e.accelerationIncludingGravity.z
      return
    ), false
    # Periodically check the position and fire
    # if the change is greater than the sensitivity
    setInterval (->
      change = Math.abs(x1 - x2 + y1 - y2 + z1 - z2)
      if change > sensitivity
        clearSignatureOnShake()
      # Update new position
      x2 = x1
      y2 = y1
      z2 = z1
      return
    ), 50
  return

# ---
# generated by js2coffee 2.0.3