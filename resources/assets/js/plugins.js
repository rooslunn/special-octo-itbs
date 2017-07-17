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

            let table = this;
            $.get(apiUrl)
                .done(function (data) {
                    table.html('');
                    let html = '';
                    data.forEach(function (client) {
                        html += `<tr class="client-row" data_cleint_id="${client['id']}">`;
                        html += `<td>${client['id']}</td>`;
                        html += `<td>${client['name']}</td>`;
                        html += `<td>${client['surname']}</td>`;
                        html += `<td>${client['code']}</td>`;
                        html += `<td>${client['email']}</td>`;
                        html += `<td>${client['address']}</td>`;
                        html += `<td>${client['town']}</td>`;
                        html += `<td>${client['country']}</td>`;
                        html += '<td>' +
                                `<button type="button" data-client_id="${client['id']}" class="button-edit">` +
                                    '<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>' +
                                '</button>' +
                                '</td>';
                        html += '<td>' +
                            `<button type="button" data-client_id="${client['id']}" class="button-delete">` +
                            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
                            '</button>' +
                            '</td>';
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
    }

    $.fn.clientAction = function() {

    }

}(jQuery));
