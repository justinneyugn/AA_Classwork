const APIUtil = require("./api_util");

class FollowToggle {
    constructor(el,options) {
        this.$el = $(el);
        this.userId = this.$el.data('user-id') || options.userId;
        this.followState = this.$el.data('initial-follow-state') || options.followState;
        this.render();
        this.handleClick();
    }

    render() {
        if (this.followState === 'unfollowed') {
            this.$el.text('Follow!');
        } else {
            this.$el.text('Unfollow!');
        }
        this.$el.prop("disabled", false);
    }

    handleClick() {
        $(this.$el).on('click', e => {
            this.$el.prop("disabled", true);
            e.preventDefault();
            if (this.followState === 'unfollowed') {
                APIUtil.followUser(this.userId)
                    .then(res => {
                        this.followState = 'followed';
                        this.$el.prop('data-initial-follow-state', 'followed');
                        this.render();
                    });
            } else {
                APIUtil.unfollowUser(this.userId)
                    .then(res => {
                        this.followState = 'unfollowed';
                        this.$el.prop('data-initial-follow-state', 'unfollowed');
                        this.render();
                    });
            }
        });
    }
}

module.exports = FollowToggle;