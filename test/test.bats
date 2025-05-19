load './test_helper/bats-support/load.bash'
load './test_helper/bats-assert/load.bash'

setup() {
  # Create a dummy input file for tests that need one
  mkdir -p "$BATS_TMPDIR/fixtures"
  cat > "$BATS_TMPDIR/fixtures/dummy.md" <<EOF
---
title: Dummy Doc
---
# Hello
EOF
  # Common path to the script relative to the test file
  SCRIPT="../../build.sh"
}

teardown() {
  # Clean up temporary files
  rm -rf "$BATS_TMPDIR/fixtures"
}

@test "can run our script" {
    run ./src/project.sh
    assert_success
    assert_output --partial "Hello"
}