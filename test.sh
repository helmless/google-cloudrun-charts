#!/bin/bash
#!/bin/bash

# Function to test a specific chart
test_chart() {
    local chart=$1
    echo "Testing chart: $chart"
    helm dependency update "charts/cloudrun/$chart"
    helm unittest "charts/cloudrun/$chart"
}

# If no argument is provided, test all charts
if [ $# -eq 0 ]; then
    echo "Testing all charts"
    test_chart "common/tests/chart"
    test_chart "service"
    test_chart "job"
else
    # Test only the specified chart
    test_chart "$1"
fi
