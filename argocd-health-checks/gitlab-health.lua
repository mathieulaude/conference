local yaml_string = [[
apiVersion: apps.gitlab.com/v1beta1
kind: GitLab
metadata:
  annotations:
    argocd.argoproj.io/tracking-id: gitlab-instance:apps.gitlab.com/GitLab:gitlab-system/gitlab
    kubectl.kubernetes.io/last-applied-configuration: >
      {"apiVersion":"apps.gitlab.com/v1beta1","kind":"GitLab","metadata":{"annotations":{"argocd.argoproj.io/tracking-id":"gitlab-instance:apps.gitlab.com/GitLab:gitlab-system/gitlab"},"name":"gitlab","namespace":"gitlab-system"},"spec":{"chart":{"values":{"global":{"hosts":{"domain":"example.com"},"ingress":{"configureCertmanager":false}}},"version":"9.9.1"}}}
  creationTimestamp: '2026-03-02T22:31:10Z'
  generation: 1
  name: gitlab
  namespace: gitlab-system
  resourceVersion: '15815'
  uid: 1f2ada6f-6487-4027-a292-8566eaeb7786
spec:
  chart:
    values:
      global:
        hosts:
          domain: example.com
        ingress:
          configureCertmanager: false
    version: 9.9.1
status:
  conditions:
    - lastTransitionTime: '2026-03-02T22:31:15Z'
      message: GitLab is initialized
      observedGeneration: 1
      reason: Initialized
      status: 'True'
      type: Initialized
    - lastTransitionTime: '2026-03-02T22:31:15Z'
      message: GitLab is starting but not yet available
      observedGeneration: 1
      reason: Available
      status: 'False'
      type: Available
  phase: Preparing
]]
local yaml = require("yaml")
local obj = yaml.decode(yaml_string)
local health_status
-- BEGIN Health check script

health_status = {}
health_status.status = "Progressing"
health_status.message = "Gitlab is Preparing"
if obj.status ~= nil then
    if obj.status.phase ~= nil then
    if obj.status.phase == "Running" then
        health_status.status = "Healthy"
        health_status.message = "Gitlab is Running"
    end
    end
end
return health_status

-- END Health check script