# Fake server using json-server

Install packages:
```
yarn install
```
or 
```
npm install
```

Generate data:
```
node casual.js > db.json
```

Run server:
```
json-server --watch db.json
```
