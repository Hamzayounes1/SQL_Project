INSERT INTO job_applied(
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES 
    (1,
    '2024-06-01',
    TRUE,
    'resume_john_doe.pdf',
    TRUE,
    'cover_letter_john_doe.pdf',
    'Pending'),
    (2,
    '2024-06-02',
    FALSE,
    NULL,
    FALSE,
    NULL,
    'Not Submitted'),
    (3,
    '2024-06-03',
    TRUE,
    'resume_jane_smith.pdf',
    TRUE,
    'cover_letter_jane_smith.pdf',
    'Pending'),
    (4,
    '2024-06-04',
    TRUE,
    'resume_john_dof.pdf',
    TRUE,
    'cover_letter_john_dof.pdf',
    'Pending'),
    (5,
    '2024-06-05',
    FALSE,
    NULL,
    FALSE,
    NULL,
    'Not Submitted'
);


SELECT * from job_applied
WHERE application_sent_date >= '2024-06-01' AND application_sent_date <= '2024-06-30';