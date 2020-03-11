<h1 style="color:rgb(100,81,138)">Thesis Requirements</h1>

<div style="float:left;font-weight:bold;">
Dashboards: &nbsp;
</div>
<div style="float:left;font-weight:bold;">
  <a href="https://dcl.dev.looker.com/dashboards/594">Olymipics Overview &#10095;</a> &nbsp;
</div>
<div style="float:left;font-weight:bold;">
  &nbsp;&nbsp;<a href="https://dcl.dev.looker.com/dashboards/596">Olympic Year &#10095;</a>  &nbsp;
</div>
<div style="float:left;font-weight:bold;">
  &nbsp;&nbsp;<a href="https://learn.looker.com/projects/advanced_lookml/files/05_extensions.md">Country &#10095;</a>  &nbsp;
</div>
<div style="float:left;font-weight:bold;">
  &nbsp;&nbsp;<a href="https://learn.looker.com/projects/advanced_lookml/files/05_extensions.md">Sport Event &#10095;</a>  &nbsp;
</div>
<div style="float:left;font-weight:bold;">
  &nbsp;&nbsp;<a href="https://dcl.dev.looker.com/dashboards/603">Athlete &#10095;</a>  &nbsp;
</div>

Put your documentation here! Your text is rendered with [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown).

Here is a roadmap of what's required for the Thesis project, and the pace at which you'll complete it.

Part 1:

- [x] Choose Dataset
    - 120 Years Olympics (1896 to 2006) &#128197;  &#9989;
- [x] Ask Questions of Dataset &#10067; &#9989;
    - Q1 - Are veteran host nations better performers at the olympics? &#127967; &#127942; &#127941;
    - Q2 - Has gender equality improved over the years? &#9792; vs &#9794;
    - Q3 - &#128176;
- [x] Choose "angle" for dataset &#9989;
    - What does the olympic performance look like for nations who have hosted the Olympics at least once? &#129351; &#129352; &#129353; &#127757;
- [x] Write Thesis Proposal &#128396; &#128467; &#9989;
- [x] Meet with Mentor and present Proposal &#9989;

Part 2:

- [x] One derived table (can also be a PDT or NDT)
- [x] At least one explore with 2+ joins &#9989;
- [ ] Drill fields on every measure
- [ ] At least one Looker Block
- [x] Check-in with Mentor

Part 3:

- [x] A feature involving Liquid HTML (parameters or templated filters) to make your explores dynamic &#9989;
- [ ] Advanced Analysis (such as Ranking, Cohort Analysis, Retention Analysis, Forecasting)
- [x] One new feature from the past three releases &#9989;
- [x] Check-in with Mentor

Part 4:

- [x] A presentable dashboard centered around a use case
- [x] Practice presentation with Mentor

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/advanced_lookml/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: safe_id {
  sql:
    CASE
      WHEN '{{ _user_attributes['can_see_id'] }}' = 'Yes'
      THEN ${id}::varchar
      ELSE MD5(${id})
    END
  ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce_advanced/order_items?qid=qmYc0gBoJg6iGJU0mTNhI6" target="_blank"><i class="fa fa-search"></i> Explore the <b>Safe ID</b> Dimension</a> <a style="color:rgb(55,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/sql" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>sql</b> Docs</a><br /><br />
