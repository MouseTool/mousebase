let promise = Promise.resolve();
let promise2 = Promise.resolve();

promise.then(() => {
    console.log("promise done!")
    let promise3 = Promise.resolve();
    promise3.then(() => {
        console.log("promise3 done!")
    });
});

promise2.then(() => {
    console.log("promise2 done!")
});

console.log("init finished"); // this alert shows first

