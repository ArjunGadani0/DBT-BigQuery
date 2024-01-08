{% macro upload_results(results) -%}

    {% if execute %}

        {% if results != [] %}
            {% do log("Uploading model executions", true) %}
            {% set model_executions = get_relation('model_executions') %}
            {% set content_model_executions = upload_model_executions(results) %}
            {{ insert_into_metadata_table(
                database_name=model_executions.database,
                schema_name=model_executions.schema,
                table_name=model_executions.identifier,
                content=content_model_executions
                )
            }}

        {% endif %}

    {% endif %}
{%- endmacro %}