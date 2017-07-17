(function ($) {
    "use strict";

    require('./plugins');

    const apiUrl = "/api/clients";
    const $table = $('#id__client_list');

    $table.clientList('load', apiUrl);


}(jQuery));
