document.addEventListener("DOMContentLoaded", function() {
  // animated squares

  var canvas = document.querySelector("canvas");
  var ctx = canvas.getContext("2d");

  ctx.fillRect(0, 0, canvas.width, canvas.height);
  var colors = ['#000', '#003', '#006', '#009', '#00c', '#00f'];

  function draw() {
    colors.forEach(function(color, i) {
      ctx.fillStyle = color;
      ctx.fillRect(i * 20, i * 20, canvas.width - i * 40, canvas.height - i * 40);
    });
  
    colors.unshift(colors.pop());
  }

  setInterval(draw, 200);


  // draw a circle
  var circleCanvas = document.querySelector("#circle");
  var circleCtx = circleCanvas.getContext("2d");
  var x = circleCanvas.width / 2;
  var y = circleCanvas.height / 2;
  var radius = x;

  circleCtx.beginPath();
  circleCtx.arc(x, y, radius, 0, 2 * Math.PI);
  circleCtx.fill();
  circleCtx.closePath();
});
