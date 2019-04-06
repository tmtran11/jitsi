import { acceptance } from "helpers/qunit-helpers";

acceptance("jitsi", { loggedIn: true });

test("jitsi works", async assert => {
  await visit("/admin/plugins/jitsi");

  assert.ok(false, "it shows the jitsi button");
});
