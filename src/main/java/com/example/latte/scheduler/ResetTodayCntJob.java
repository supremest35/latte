package com.example.latte.scheduler;

import java.time.LocalDateTime;

import org.quartz.InterruptableJob;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.UnableToInterruptJobException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

import com.example.latte.service.MiniHomeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class ResetTodayCntJob extends QuartzJobBean implements InterruptableJob {

	@Autowired
	MiniHomeService miniHomeService;
	
    private boolean isInterrupted = false;
    private JobKey jobKey = null;
	
    @Override
	public void interrupt() throws UnableToInterruptJobException {
    	log.info(jobKey + "  -- INTERRUPTING --");
        isInterrupted = true;
	}
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		jobKey = context.getJobDetail().getKey();
        log.info("GradeRatingCronJob executeInternal invoked, jobKey: " + jobKey + ", time:" + LocalDateTime.now().toString());
        if (isInterrupted) {
            log.warn("jobKey: " + jobKey + "is Interrupted.");
            return;
        }
        JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
        miniHomeService.resetMiniHomeTodayCnt();
	}
}
