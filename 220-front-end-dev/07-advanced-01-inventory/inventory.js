// var inventory;

// (function() {
//   inventory = {
//     collection: [],
//     setDate: function() {
//       var date = new Date();
//       $("#order_date").text(date.toUTCString());
//     },
//     cacheTemplate: function() {
//       var $i_tmpl = $("#inventory_item").remove();
//       this.template = $i_tmpl.html();
//     },
//     init: function() {
//       this.setDate();
//       this.cacheTemplate();
//     },
//   };

// })();

// $(inventory.init.bind(inventory));

// $(function() {
//   var nextId = 1;
//   function addInventory() {
//     var id = nextId++;
//     $(inventory.template).children().eq(0).children().eq(0).val(id).parent().parent().appendTo($("#inventory"));
//     inventory.collection.push({
//       id: id,
//       name: "",
//       stockNumber: "",
//       quantity: 1
//     });
//   }

//   $("#add_item").on("click", function(e) {
//     e.preventDefault();

//     addInventory();
//   });

//   $("#inventory").on("focusout", "input", function(e) {
    
//     var item_id = +$(e.target).parent().parent().children().eq(0).children().eq(0).val();
//     var field;
//     if ($(e.target).attr("name") === "item_name_ID") {
//       field = "name";
//     } else if ($(e.target).attr("name") === "item_stock_number_ID") {
//       field = "stockNumber";
//     } else if ($(e.target).attr("name") === "item_quantity_ID") {
//       field = "quantity";
//     }

//     var value = $(e.target).val();

//     inventory.collection.forEach(function(line) {
//       if (line.id === item_id) {
//         line[field] = value;
//       } 
//     });
//   });

//   $("#inventory").on("click", "a.delete", function(e) {
//     e.preventDefault();

//     var item_id = +$(e.target).parent().parent().children().eq(0).children().eq(0).val();
//     var indexToRemove;
//     inventory.collection.forEach(function(line, idx) {
//       if (line.id === item_id) {
//         indexToRemove = idx;
//       }
//     });
//     inventory.collection.splice(indexToRemove, 1);
//     $(e.target).parent().parent().remove();
//     console.log(inventory.collection);
//   });

// });

// Refactor according to solution

