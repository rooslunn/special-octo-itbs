(function ($) {
    "use strict";

    const apiUrl = "/api/clients";
    const $table = $('#id__client_list');

    $.fn.clientList = function (action, apiUrl) {
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
                        html += `<tr data_cleint_id="${client['id']}">`;
                        html += `<td">${client['id']}</td>`;
                        html += `<td>${client['name']}</td>`;
                        html += `<td>${client['surname']}</td>`;
                        html += `<td>${client['code']}</td>`;
                        html += `<td>${client['email']}</td>`;
                        html += `<td>${client['address']}</td>`;
                        html += `<td>${client['town']}</td>`;
                        html += `<td>${client['country']}</td>`;
                        html += '</tr>';
                    });
                    table.html(html);
                }).fail(function (err) {
                    console.error(err);
                });
        }
    }

    $table.clientList('load', apiUrl);


}(jQuery));
