# frozen_string_literal: true

bind "tcp://0.0.0.0:8080"
# single mode: https://github.com/puma/puma/blob/master/docs/deployment.md#single-vs-cluster-mode
workers 0
