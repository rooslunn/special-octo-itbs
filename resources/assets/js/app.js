(function ($) {
    "use strict";

    require('./plugins');

    const apiUrl = "/api/clients";
    const $table = $('#id__client_list');

    $table.clientList('load', apiUrl,
        function clientEdit() {
            console.info('Edit: ' + $(this).data('client_id'));
        },
        function clientDelete() {
            console.info('Delete: ' + $(this).data('client_id'));
        }
    );


}(jQuery));
