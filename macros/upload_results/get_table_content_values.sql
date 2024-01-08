{% macro get_table_content_values(dataset, objects_to_upload) %}

    {# Convert the results to data to be imported #}

    {% if dataset == 'model_executions' %}
        {% set content = upload_model_executions(objects_to_upload) %}
    {% elif dataset == 'seed_executions' %}
        {% set content = upload_seed_executions(objects_to_upload) %}
    {% elif dataset == 'test_executions' %}
        {% set content = upload_test_executions(objects_to_upload) %}
    {% elif dataset == 'snapshot_executions' %}
        {% set content = upload_snapshot_executions(objects_to_upload) %}
    {% elif dataset == 'exposures' %}
        {% set content = upload_exposures(objects_to_upload) %}
    {% elif dataset == 'models' %}
        {% set content = upload_models(objects_to_upload) %}
    {% elif dataset == 'seeds' %}
        {% set content = upload_seeds(objects_to_upload) %}
    {% elif dataset == 'snapshots' %}
        {% set content = upload_snapshots(objects_to_upload) %}
    {% elif dataset == 'sources' %}
        {% set content = upload_sources(objects_to_upload) %}
    {% elif dataset == 'tests' %}
        {% set content = upload_tests(objects_to_upload) %}
    {# Invocations only requires data from variables available in the macro #}
    {% elif dataset == 'invocations' %}
        {% set content = upload_invocations() %}
    {% endif %}

    {{ return(content) }}

{% endmacro %}
