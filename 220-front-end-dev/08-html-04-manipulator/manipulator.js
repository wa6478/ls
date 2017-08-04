var canvas = document.createElement("canvas");
var ctx = canvas.getContext("2d");

var preloader = {
  path: "images/",
  srcs: ["1.jpg", "2.jpg", "3.jpg"],
  createImage: function(i, src) {
    $img = $("<img />", { src: this.path + src });
    $img.on("load", manipulator.process.bind(manipulator));
  },
  run: function() {
    $.each(this.srcs, this.createImage.bind(preloader));
  }
};

var manipulator = {
  drawImage: function(img) {
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0);
  },
  getData: function() {
    return ctx.getImageData(0, 0, canvas.width, canvas.height);
  },
  convertToGrayscale: function() {
    var image_data = this.getData();
    var gray_data;

    for (var i = 0, len = image_data.data.length; i < len; i += 4) {
      gray_data = image_data.data[i] * 0.3086 + image_data.data[i + 1] * 0.6094 + image_data.data[i + 2] * 0.0820;
      image_data.data[i] = gray_data;
      image_data.data[i + 1] = gray_data;
      image_data.data[i + 2] = gray_data;
    }
    ctx.putImageData(image_data, 0, 0);
  },
  writeImage: function() {
    var img = document.createElement("img");

    img.src = canvas.toDataURL();
    $(document.body).append(img);
  },
  process: function(e) {
    var img = e.target;
    this.drawImage(img);
    this.convertToGrayscale();
    this.writeImage();
  }
}

$(preloader.run.bind(preloader));

// need to run on a server otherwise cross-origin policy complains