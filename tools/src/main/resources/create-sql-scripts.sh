#!/usr/bin/env bash

# Turns off foreign key cheks to speed up script execution
cat database/mysql_script_header.sql > upgrade/new-install.sql

# adds the current concept dictionary
cat database/concept_dictonary_ref.sql >> upgrade/new-install.sql

# adds functions and procedures for BIRT reports
cat database/enable_birt_report_function.sql >> upgrade/new-install.sql

# cleans up the data integrity module which will be re-installed
cat database/cleanup_data_integrity_module.sql >> upgrade/new-install.sql

# Turns on foreign key checks
cat database/mysql_script_footer.sql >> upgrade/new-install.sql

# Create an SQL script for an upgrade

# Turns off foreign key cheks to speed up script execution
cat database/mysql_script_header.sql > upgrade/upgrade.sql

# adds the current concept dictionary
cat database/concept_dictonary_ref.sql >> upgrade/upgrade.sql

# transform encounters from pre-1.11
cat database/1.6_to_1.11_migration_scripts/transform_encounters_from_old_to_new.sql >> upgrade/upgrade.sql

# Actual data migration from the openmrs_backup to openmrs database
cat database/1.6_to_1.11_migration_scripts/1.6_to_1.11_data_transfer.sql >> upgrade/upgrade.sql

# add visits to encounters - which is required in 1.11.x
cat database/1.6_to_1.11_migration_scripts/add_visit_to_encounter.sql >> upgrade/upgrade.sql

# adds functions and procedures for BIRT reports
cat database/enable_birt_report_function.sql >> upgrade/upgrade.sql

# cleans up the data integrity module which will be re-installed
cat database/cleanup_data_integrity_module.sql >> upgrade/upgrade.sql

# Turns on foreign key checks
cat database/mysql_script_footer.sql >> upgrade/upgrade.sql
