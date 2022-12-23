{
  "regexManagers": [
    {
      "fileMatch": ["{{arg0}}"],
      "matchStrings": [
        " +['\"]?version['\"]? *: +['\"]?kustomize/(?<currentValue>[^'\" \\n]+)['\"]? +# renovate: depName=kubernetes-sigs/kustomize[ \\n]",
        " +['\"]?name['\"]? *: +['\"]?kubernetes-sigs/kustomize@kustomize/(?<currentValue>[^'\" \\n]+)['\"]?"
      ],
      "extractVersionTemplate": "^kustomize/(?<version>.*)$",
      "datasourceTemplate": "github-releases",
      "depNameTemplate": "kubernetes-sigs/kustomize"
    }
  ]
}

