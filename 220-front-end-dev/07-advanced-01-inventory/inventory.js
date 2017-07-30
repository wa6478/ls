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

// Follow along per solution:

// var inventory;

// (function() {
//   inventory = {
//     lastId: 0,
//     collection: [],
//     setDate: function() {
//       var date = new Date();
//       $("#order_date").text(date.toUTCString());
//     },
//     cacheTemplate: function() {
//       var $i_tmpl = $("#inventory_item").remove();
//       this.template = $i_tmpl.html();
//     },
//     add: function() {
//       this.lastId++;
//       var item = {
//         id: this.lastId,
//         name: "",
//         stock_number: "",
//         quantity: 1
//       };
//       this.collection.push(item);

//       return item;
//     },
//     remove: function(id) {
//       this.collection = this.collection.filter(function(item) {
//         return item.id !== id;
//       });
//     },
//     get: function(id) {
//       var foundItem;

//       this.collection.forEach(function(item) {
//         if (item.id === id) {
//           foundItem = item;
//           return false;
//         }
//       });

//       return foundItem;
//     },
//     update: function($item) {
//       var id = this.findId($item);
//       var item = this.get(id);

//       item.name = $item.find("[name^=item_name]").val();
//       item.stock_number = $item.find("[name^=item_stock]").val();
//       item.quantity = $item.find("[name^=item_quantity]").val();
//     },
//     newItem: function(e) {
//       e.preventDefault();
//       var item = this.add();
//       var $item = $(this.template.replace(/ID/g, item.id));

//       $("#inventory").append($item);
//     },
//     findParent: function(e) {
//       return $(e.target).closest("tr");
//     },
//     findId: function($item) {
//       return +$item.find("input[type=hidden]").val()
//     },
//     deleteItem: function(e) {
//       e.preventDefault();
//       var $item = this.findParent(e).remove();

//       this.remove(this.findId($item));
//     },
//     updateItem: function(e) {
//       var $item = this.findParent(e);

//       this.update($item);
//     },
//     bindEvents: function() {
//       $("#add_item").on("click", this.newItem.bind(this));
//       $("#inventory").on("click", "a.delete", this.deleteItem.bind(this));
//       $("#inventory").on("blur", ":input", this.updateItem.bind(this));
//     },
//     init: function() {
//       this.setDate();
//       this.cacheTemplate();
//       this.bindEvents();
//     }
//   }
// })();

// $(inventory.init.bind(inventory));

// technically, could also have a function expression which invokes init with inventory as the receiver:
// $(function() {
//   inventory.init();
// });

// make everything private:

$(function() {
  (function() {
    var inventory = {
      lastId: 0,
      collection: [],
      setDate: function() {
        var date = new Date();
        $("#order_date").text(date.toUTCString());
      },
      cacheTemplate: function() {
        var $i_tmpl = $("#inventory_item").remove();
        this.template = $i_tmpl.html();
      },
      add: function() {
        this.lastId++;
        var item = {
          id: this.lastId,
          name: "",
          stock_number: "",
          quantity: 1
        };
        this.collection.push(item);

        return item;
      },
      remove: function(id) {
        this.collection = this.collection.filter(function(item) {
          return item.id !== id;
        });
      },
      get: function(id) {
        var foundItem;

        this.collection.forEach(function(item) {
          if (item.id === id) {
            foundItem = item;
            return false;
          }
        });

        return foundItem;
      },
      update: function($item) {
        var id = this.findId($item);
        var item = this.get(id);

        item.name = $item.find("[name^=item_name]").val();
        item.stock_number = $item.find("[name^=item_stock]").val();
        item.quantity = $item.find("[name^=item_quantity]").val();
      },
      newItem: function(e) {
        e.preventDefault();
        var item = this.add();
        var $item = $(this.template.replace(/ID/g, item.id));

        $("#inventory").append($item);
      },
      findParent: function(e) {
        return $(e.target).closest("tr");
      },
      findId: function($item) {
        return +$item.find("input[type=hidden]").val()
      },
      deleteItem: function(e) {
        e.preventDefault();
        var $item = this.findParent(e).remove();

        this.remove(this.findId($item));
      },
      updateItem: function(e) {
        var $item = this.findParent(e);

        this.update($item);
        console.log(this.collection);
      },
      bindEvents: function() {
        $("#add_item").on("click", this.newItem.bind(this));
        $("#inventory").on("click", "a.delete", this.deleteItem.bind(this));
        $("#inventory").on("blur", ":input", this.updateItem.bind(this));
      },
      init: function() {
        this.setDate();
        this.cacheTemplate();
        this.bindEvents();
      }
    }

    inventory.init();
  })();
})