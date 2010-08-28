function Book() {

    var post_a_book = $('.post_a_book');

    var posted_books = $('.posted_books tbody tr');
    var edit_link_selector = '.edit_link a';

//    var add_button = $('#post_book');


    this.attachEvents = function() {
        //        onAddClick();
        onEditBookLinkClick();
    };

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

//    function onSuccess(data, textStatus, xhr) {
//    }
//
//    function onComplete(xhr, textStatus) {
//    }
//
//    function onError() {
//    }
//
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
