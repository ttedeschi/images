#!/usr/bin/env python3
import htcondor

schedd = htcondor.Schedd()
for it in schedd.xquery(projection=["Requirements", "Owner", "JobId","JobStatus", "RequestMemory", "RequestCpus"]):
    SiteName = str(it["Requirements"]).split("SiteName == \"")
    if len(SiteName) > 1:
        SiteName = SiteName[1].split("\"")[0]
    else:
        SiteName = ""

    if "JobId" not in it:
        continue

    try:
        it["RequestMemory"] = it["RequestMemory"].eval()
    except:
        pass

    try:
        it["RequestCpus"] = it["RequestCpus"].eval()
    except:
        pass

    JobStatus = htcondor.JobStatus(it["JobStatus"]).name

    print("job,JobId=\"%s\",owner=\"%s\",SiteName=\"%s\",JobStatus=\"%s\" count=1,memory=%d,cpus=%d" % (it["JobId"], it["Owner"], SiteName, JobStatus, it["RequestMemory"], it["RequestCpus"]))
