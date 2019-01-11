<template>
    <div class="showcase" />
</template>

<script>
export default {
  name: 'Showcase',
};
</script>

<style lang="scss" scoped>
    .showcase {
        position: fixed;
        z-index: -1;
        width: 100%;
        height: 100vh;
        background-image: url('../assets/showcase.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: 90% 0%;

        @media (min-width: 1024px) {
            background-position: bottom right;
        }

    }

    .showcase::after {
        content: '';
        background: rgba(0,0,0, 0.15);
        position: absolute;
        top: 0;
        left: 0;
        z-index: 1;
        width: 100%;
        height: 100vh;
    }

</style>
