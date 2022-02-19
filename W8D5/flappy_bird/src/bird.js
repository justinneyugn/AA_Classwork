export default class Bird {
    constructor(dimensions) {
        this.dimensions = dimensions;
        this.velocity = 0;
        this.y = this.dimensions.height / 2;
        this.x = this.dimensions.width / 3;
    }

    drawBird (ctx){
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.x, this.y, 40, 30);
    }

    animate (ctx){
        this.move();
        this.drawBird(ctx);
    }

    move (){
        this.y += this.velocity;
        this.velocity += 0.5;
    }

    flap (){
        this.velocity = -8;
    }
}