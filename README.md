# Swisstronik Testnet Dev Quest 5

```
git clone https://github.com/intellygentle/SwissPerc721.git
cd SwissPerc721
```
```
npm install dotenv
```
```
touch .env
echo ".env" >> .gitignore
code .env
```
configure your .env file
<img width="539" alt="privKey" src="https://github.com/user-attachments/assets/d8e26df0-82d0-48c5-b12f-e41983ebdabe">

```
npx hardhat run scripts/deploy2.js --network swisstronik
```
<img width="593" alt="depl" src="https://github.com/user-attachments/assets/0d69a932-e0f6-4158-bfb2-46ab0ecd65d0">

edit the mint.js file with the deployed contract address and the wallet address of your burner private key

<img width="726" alt="mintjs" src="https://github.com/user-attachments/assets/62e2babc-d0ef-44c3-aad7-59db8da78d6f">

```
npx hardhat run scripts/mint.js --network swisstronik
```

edit the balOf.js with your contract address and your burner private key. be sure to remove the private key
<img width="719" alt="baljs" src="https://github.com/user-attachments/assets/79f7f75a-3680-4815-bcd1-a2a0c30b982a">

```
npx hardhat run scripts/balOf.js --network swisstronik
```
<img width="587" alt="balres" src="https://github.com/user-attachments/assets/2af6e319-a706-44f5-b10c-acd733c2d1d2">

# Push To Github
```
git remote remove origin
```
```
git remote add origin https://yourGitRepoLink
```
```
git checkout --orphan new-main
git add -A
git commit -m "Initial commit"
git branch -D main
git branch -m main
git push -f origin main
```





