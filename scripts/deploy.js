
async function main() {


    const Music = await ethers.getContractFactory("Musica");
    const music = await Music.deploy();
    await music.deployed();
    console.log("Music address:", music.address);


}


main().then(() => process.exit(0))
    .catch(err => {
        console.log(err)
        process.exit(1)
    })
