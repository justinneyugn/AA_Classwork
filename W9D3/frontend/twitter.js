const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$(document).ready(function () {
    let $buttons = $('.follow-toggle');
    $buttons.each((id, button) => {
        new FollowToggle(button);
    });

    let $navs = $('.users-search');
    $navs.each((id, nav) => {
        new UsersSearch(nav);
    });
});