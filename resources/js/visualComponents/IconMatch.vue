<template>
    <b-tooltip :label="match.homeName + ' ' + match.home_score + ' - ' + match.awayName + ' ' + match.away_score">
        <b-icon pack="fas" :icon="icon" :type="type" />
    </b-tooltip>
</template>

<script>

export default {
    props: {
        match: {},
        team: 0
    },
    computed: {
        result: function() {
            let home_score = this.match.home_score;
            let away_score = this.match.away_score;
            if (home_score == 0 && away_score == 0) {
                return "lose";
            }
            if (this.team == this.match.home) {
                if (home_score > away_score) {
                    return "win";
                } else {
                    if (away_score > home_score) {
                        return "lose";
                    } else {
                        return "draw";
                    }
                }
            }
            if (this.team == this.match.away) {
                if (home_score < away_score) {
                    return "win";
                } else {
                    if (away_score < home_score) {
                        return "lose";
                    } else {
                        return "draw";
                    }
                }
            }
        },
        icon: function() {
            switch(this.result) {
                case "win":
                    return "check-circle";
                case "lose":
                    return "times-circle";
                case "draw":
                    return "remove-circle";
            }
        },
        type: function() {
            switch(this.result) {
                case "win":
                    return "is-success";
                case "lose":
                    return "is-danger";
                case "draw":
                    return "";
            }
        }
    }
}
</script>