# Deploy over RSYNC via SSHPASS

Github Action to deploy via rsync and sshpass
in order to enable deployments on hosts, which don't support key based ssh

## Usage
```yml
- name: Deploy to Server
  uses: inf166/action-sshpass-rsync@v1
  with:
    host: ${{ secrets.DEPLOY_HOST }}
    user: ${{ secrets.DEPLOY_USER }}
    port: ${{ secrets.DEPLOY_PORT }}
    pass: ${{ secrets.DEPLOY_PASS }}
    local: "path/of/your/local/mashine"
    exclude: "path/to/exclude/"
    remote: "path/where/to/deploy/to"
    runBeforeDeployment: |
      cd somewhere/
    runAfterDeployment: |
      cd ../somewhere/back/to
```

You can do something before and after your deployment on the remote.
For this, you use the `runBeforeDeployment` and `runAfterDeployment` inputs.

### Optional (and not firmly tested)

You can use your private key and just enjoy the deployment part of this action.
But I must say, that I have not tested this.
Feel free to contribute.

```yml
- name: Deploy to Server
  uses: inf166/action-sshpass-rsync@v1
  with:
    host: ${{ secrets.DEPLOY_HOST }}
    user: ${{ secrets.DEPLOY_USER }}
    port: ${{ secrets.DEPLOY_PORT }}
    key: ${{ secrets.PRIVATE_KEY }}
    local: "path/of/your/local/mashine"
    exclude: "path/to/exclude/"
    remote: "path/where/to/deploy/to"
    runBeforeDeployment: |
      cd somewhere/
    runAfterDeployment: |
      cd ../somewhere/back/to
```

## Disclaimer
Parts of this action are heavily inspired by 
[matheusvanzan/sshpass-action](https://github.com/matheusvanzan/sshpass-action/)
and
[D3rHase/rsync-deploy-action](https://github.com/D3rHase/rsync-deploy-action).

I have looked up how to make my own action there and build upon their code.
So please give them some love.
