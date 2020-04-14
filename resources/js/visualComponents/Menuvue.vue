<template>
    <b-menu>
        <b-menu-list label="Menu">
            
            <b-menu-item label="Inicio" tag="router-link" to="/" exact></b-menu-item>
            <b-menu-item label="Torneos" tag="router-link" to="/torneos"></b-menu-item>
            <b-menu-item label="Partidos" tag="router-link" to="/partidos"></b-menu-item>
            <b-menu-item label="Incidencias" tag="router-link" to="/incidencias"></b-menu-item>
            <b-menu-item label="Planilla" tag="router-link" to="/planilla"></b-menu-item>
            <b-menu-item label="Posiciones" tag="router-link" to="/posiciones"></b-menu-item>
            <b-menu-item label="Acerca de" tag="router-link" to="/acercade"></b-menu-item>
 
        </b-menu-list>
    </b-menu>
</template>
<script>
export default {
      data() {
    return {
      isActive: true
    }
  }
}
</script>