{% macro get_query_run_details() %}
INSERT
    `dbt_log.model_logs` WITH sub AS (
        SELECT
            jobs.start_time as creation_time,
            jobs.project_id,
            jobs.user_email as user_email,
            jobs.job_id,
            jobs.job_type as job_nature, -- can be load, query, extract or copy
            jobs.statement_type,
            jobs.start_time,
            jobs.end_time,
            jobs.total_slot_ms, -- job execution time in milliseconds
            jobs.error_result.reason AS err_reason,
            jobs.error_result.message AS err_message,
            jobs.query,
            jobs.total_bytes_processed,
            lbls.value AS invocation_id,
            jobs.dml_statistics.inserted_row_count as rows_inserted,
            jobs.dml_statistics.deleted_row_count as rows_deleted,
            jobs.dml_statistics.updated_row_count as rows_updated
        FROM
            `region-us.INFORMATION_SCHEMA.JOBS_BY_USER` jobs
            CROSS JOIN unnest(jobs.labels) AS lbls
        WHERE
            lbls.value = '{{ invocation_id }}'
            AND DATE(creation_time) >= CURRENT_DATE() - 1
    )
SELECT
    *
FROM sub
{% endmacro %}