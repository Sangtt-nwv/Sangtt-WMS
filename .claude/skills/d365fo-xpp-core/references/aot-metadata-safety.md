# AOT metadata safety gates

Use these gates for every generated or directly edited D365FO metadata object. A generator is a scaffold, not proof that the object is complete or buildable.

## 1. Ground every symbol

- Resolve every EDT, enum, table, field, relation target, class, method, menu item, and form control against the current metadata index.
- Verify model dependencies before using a platform symbol. A familiar AX/D365 name is not evidence that it exists in this application version.
- Never substitute an approximate EDT name. Errors such as `BankAccount`, `MainAccountNum`, `DimensionDefault`, or `DimensionDynamicAccount` usually mean the symbol or dependency was guessed.
- Do not declare a normal field with a reserved system-field name such as `CreatedDateTime`.
- Ensure relation fields use compatible EDTs or primitive bases on both sides.

## 2. Treat AOT XML as ordered DataContract data

- XML well-formedness is necessary but insufficient.
- Element names, `i:type` values, enum values, child locations, and element order must match the current platform metadata contract.
- Copy the exact shape from a compiling object of the same AOT type and control type in the current environment.
- Never invent control types such as `AxFormIntControl`; use verified types such as `AxFormIntegerControl`.
- Never invent enum values such as `FastTabs` for `TabPageStyle`. Copy the property/value pair from a current canonical form.
- Preserve the relative order used by the same `i:type`. With forms, a wrong property order can make DataContract deserialization silently discard `<Controls>` while Visual Studio still displays raw nodes.
- After a direct XML edit, deserialize the object with the current `Microsoft.Dynamics.AX.Metadata*.dll` assemblies when available. Compare raw and deserialized control counts.

## 3. Complete every new AxTable

Unless a verified canonical peer proves an exception, every generated AxTable must contain these standard field groups in this order:

1. `AutoReport`
2. `AutoLookup`
3. `AutoIdentification` with `AutoPopulate=Yes`
4. `AutoSummary`
5. `AutoBrowse`

Keep `<Fields />` when a standard group has no explicit members. Add business field groups such as `Overview` only when the design requires them.

Also verify:

- business-role `TableGroup` versus storage `TableType`;
- primary/clustered/alternate-key indexes;
- realistic uniqueness and company scope;
- relations and delete actions;
- title fields for setup/master tables;
- labels and configuration keys;
- form `DataGroup` references resolve to a field group on the datasource table.

If `d365fo generate table` omits any standard group, patch the generated XML before creating forms or building.

## 4. Validate form patterns as trees

Choose a compiling canonical form from the current platform or repository and match its exact pattern version and hierarchy.

- Required pattern roles must exist at the required location. Names alone do not satisfy a role.
- A Tab control contains TabPage controls, not fields or groups directly.
- `DetailsTransaction` requires the application bar, navigation list, main tab, details title area, header/line panels, grid panel, custom/quick filter group, main grid, and hidden default-action command.
- Do not assign arbitrary subpatterns or versions such as `SidePanel 1.0` or `ToolbarAndFields 1.1`.
- Assign `Pattern`/`PatternVersion` only to the pattern root. Do not repeat `FieldsFieldGroups` on its child field groups.
- For `FieldsFieldGroups 1.1`, the pattern root uses `ColumnsMode=Fill`; direct child field groups use `ColumnsMode=Fixed`.
- Verify ActionPane visibility, datasource binding, linked datasource `LinkType`, default action, quick-filter target, and menu-item `FormViewOption`.
- Validate both the root pattern and every explicitly assigned nested pattern with the current platform pattern analyzer or the Visual Studio Pattern tab.

## 5. Apply the validation ladder

Run these checks in order:

1. `git diff --check`
2. Parse XML and verify the expected root type.
3. `d365fo validate xpp <file> --code-type xml-table --output json` for AxTable, or `xml-any` for other XML.
4. `d365fo index refresh --model <Model> --output json`
5. `d365fo get table <Table> --output json` or `d365fo get form <Form> --output json`
6. Cross-check table field groups against all form `DataGroup` values.
7. Deserialize form metadata and run the active platform pattern analyzer when assemblies are available.
8. Build the target model only when authorized.
9. Run database sync after table changes only when authorized.

Do not report a full build as passed unless the build actually ran in the D365FO-enabled Visual Studio/MSBuild environment.

## 6. Classify build failures

Fix primary metadata/compiler errors first. Messages about restoring `.pdb*.delete`, missing rollback files, locked label DLLs, or stale compiler artifacts are often collateral failures.

After primary errors are fixed:

1. close Visual Studio and its designers;
2. ensure the old `xppcAgent` process has stopped;
3. reopen Visual Studio as required by the environment;
4. perform a fresh model build;
5. clean only the exact model artifacts if the collateral failure repeats.

Never broadly delete package, bin, workspace, or model directories.
