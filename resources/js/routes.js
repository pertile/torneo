import Home from './pageComponents/Home';
import About from './pageComponents/About';
import NotFound from './pageComponents/NotFound';
import Match from './pageComponents/Match';
import Incident from './pageComponents/Incident';
import Standings from './pageComponents/Standings';
import VueRouter from 'vue-router';

let routes = [
    {
        path: '*',
        component: NotFound
    },
    {
        path: '/',
        component: Home
    },
    {
        path: '/acercade',
        component: About
    },
    {
        path: '/partidos',
        component: Match
    },
    {
        path: '/incidencias',
        component: Incident
    },
    {
        path: '/posiciones',
        component: Standings
    }
]

export default new VueRouter({
    routes,
    mode: 'history',
    linkActiveClass: 'is-active'
});