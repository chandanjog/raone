function Book() {

    var post_a_book = $('.post_a_book');
    var tag_list = post_a_book.find('#book_tag_list');

    var posted_books = $('.posted_books');
    var edit_link_selector = '.edit_link a';

    //    var add_button = $('#post_book');


    this.attachEvents = function() {
        onEditBookLinkClick();
        //        onTagListTypeWatch();
        autocompleteOnTagList();
    };


    function formatItem(row) {
        console.log(row[0]);
        return row[0];
    }
    function formatResult(row) {
//        return row[0].replace(/(<.+?>)/gi, '');
    }

    function autocompleteOnTagList() {
        $(tag_list).autocomplete('/books/tags', {
            width: 300,
            multiple: true,
            matchContains: true,
            formatItem: formatItem,
            formatResult: formatResult
        });
    }


    function onEditBookLinkClick() {
        posted_books.each(function(index, element) {
            var edit_link = $(element).find(edit_link_selector);
            edit_link.click(function() {
                var edit_url = $(this).attr('url_to_post');
                var edit_a_book = post_a_book.clone();
                edit_a_book.find('form').attr('action', edit_url);
                edit_a_book.dialog();
            });
        });
    }



//    function fetchTagList() {
//        $.ajax({
//            url: "/books/tags",
//            data: {'search_tags_on' : $(tag_list).val() },
//            type: "GET",
//            success: onSuccess,
//            error:onError,
//            complete: onComplete
//        });
//    }
//
//
//    function onTagListTypeWatch() {
//        var options = {
//            callback : fetchTagList,
//            wait:1000,
//            highlight:true,
//            captureLength:2
//        };
//        $(tag_list).typeWatch(options);
//    }
//
//
//
//    function onSuccess(data, textStatus, xhr) {
//        alert(data);
//        console.log(data);
//    }
//
//    function onComplete(xhr, textStatus) {
//    }
//
//    function onError() {
//    }


    //    function onAddClick() {
    //        add_button.click(function() {
    //            $.ajax({
    //                url: "/books/add",
    //                type: "POST",
    //                data: $('form').serialize(),
    //                success: onSuccess,
    //                error:onError,
    //                complete: onComplete
    //            });
    //        });
    //    }
}
