<template>
    <div class="claimWrapper">
        <h1 class="claim">Universe</h1>
        <p class="subclaim">
            Search for amazing images from the whole universe using NASA API.
        </p>
        <p class="subclaim">
            Type anything space-related to start
        </p>
    </div>
</template>

<script>
export default {
  name: 'Claim',
};
</script>

<style lang="scss" scoped>
 .claimWrapper {
     display: flex;
     text-align: center;
     flex-direction: column;
     justify-content: center;
     align-items: center;
     color: #fff;
 }

 .claim {
     font-size: 5em;
     text-transform: uppercase;
     margin: 0;

     @media (min-width: 768px) {
         font-size: 8em;
     }

     @media (min-width: 1024px) {
         font-size: 12em;
     }
 }

 .subclaim {
     margin: 20px 0 0 0;
     font-size: 1.3em;
     font-weight: 200;


     @media (min-width: 768px) {
         font-size: 1.7em;
         font-weight: 400;
         line-height: 1.5;
         letter-spacing: 1.2px;
         width: 600px;
     }

     @media (min-width: 768px) {
         width: 800px;
     }
 }

</style>
