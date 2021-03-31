<!-- Copyright Contributors to the Open Cluster Management project -->
# insights-chart
[Open Cluster Management](https://open-cluster-management.io/) - Helm chart for the insights component.


### To install this chart

1. Log in to your cluster with the following command:

   ```bash
   oc login --server=https://api.<your-cluster-ip>:6443
   ```

2. Create an image pull secret with your artifactory credentials:

   ```bash
   oc create secret docker-registry -n open-cluster-management quay-secret --docker-server=quay.io \
   --docker-username=<quay.io user> \
   --docker-password=<quay.io token>
   ```
3. Clone this repo (`insights-chart`) on your local machine. 

4. Package the chart with the following command:
   
   ```bash
   make build-local
   ```
   
5. Install the chart with the following command:
  
   ```bash
   helm upgrade --install insights \
   --namespace open-cluster-management \
   --set global.pullSecret=quay-secret \
   stable/insights-chart-2.3.0.tgz --tls
   ```
