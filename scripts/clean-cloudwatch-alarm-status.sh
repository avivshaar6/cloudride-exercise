aws cloudwatch set-alarm-state \
    --alarm-name "container-error-threshold" \
    --state-value OK \
    --state-reason "Manual reset" \
    --region eu-central-1