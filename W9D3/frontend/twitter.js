const FollowToggle = require('./follow_toggle');

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