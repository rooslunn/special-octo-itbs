/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(1);
module.exports = __webpack_require__(2);


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

(function ($) {
    "use strict";

    __webpack_require__(7);

    var apiUrl = "/api/clients";
    var $table = $('#id__client_list');

    $table.clientList('load', apiUrl, function clientEdit() {
        console.info('Edit: ' + $(this).data('client_id'));
    }, function clientDelete() {
        console.info('Delete: ' + $(this).data('client_id'));
    });
})(jQuery);

/***/ }),
/* 2 */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),
/* 3 */,
/* 4 */,
/* 5 */,
/* 6 */,
/* 7 */
/***/ (function(module, exports) {

/**
 * Created by russ on 17.07.17.
 */

(function ($) {
    "use strict";

    $.fn.clientList = function (action, apiUrl, editAction, deleteAction) {
        if (action === "clear") {
            this.html("");
            return this;
        }

        if (action === "load") {

            var table = this;
            $.get(apiUrl).done(function (data) {
                table.html('');
                var html = '';
                data.forEach(function (client) {
                    html += "<tr class=\"client-row\" data_cleint_id=\"" + client['id'] + "\">";
                    html += "<td>" + client['id'] + "</td>";
                    html += "<td>" + client['name'] + "</td>";
                    html += "<td>" + client['surname'] + "</td>";
                    html += "<td>" + client['code'] + "</td>";
                    html += "<td>" + client['email'] + "</td>";
                    html += "<td>" + client['address'] + "</td>";
                    html += "<td>" + client['town'] + "</td>";
                    html += "<td>" + client['country'] + "</td>";
                    html += '<td>' + ("<button type=\"button\" data-client_id=\"" + client['id'] + "\" class=\"button-edit\">") + '<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>' + '</button>' + '</td>';
                    html += '<td>' + ("<button type=\"button\" data-client_id=\"" + client['id'] + "\" class=\"button-delete\">") + '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' + '</button>' + '</td>';
                    html += '</tr>';
                });
                table.html(html);

                if ($.type(editAction) === 'function') {
                    $('.button-edit').bind("click", editAction);
                }
                if ($.type(deleteAction) === 'function') {
                    $('.button-delete').bind("click", deleteAction);
                }
            }).fail(function (err) {
                console.error(err);
            });
        }
    };

    $.fn.clientAction = function () {};
})(jQuery);

/***/ })
/******/ ]);