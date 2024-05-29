# ArozOS Developers
Documentation for ArozOS development



This is a repo contains the documentation for developing apps or service for ArozOS. 

### Requirement

- Hugo (extended version)

#### Editing
To view edited content in real time, cd into the `src` folder and run 
```
cd ./src/
hugo server
```

Following that, open `http://localhost:1313/ArozOS-Developers/` in your browser to see real-time changes.

#### Build From Source

```
//Building the website
cd ArozOS-Developers/src/
hugo

//Move it to production
cp -a ./ArozOS-Developers/src/public/ ./doc/
```

### Contribute Documents

If you want to contribute documentation titles to the doc, create a folder in the content/contribute/ folder with your username and create a PR. I will process them once I got the time.

### License

GPLv3
