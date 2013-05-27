/*
 * Copyright 2002-2013 the original author or authors
 *
 *     Licensed under the Apache License, Version 2.0 (the "License");
 *     you may not use this file except in compliance with the License.
 *     You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 *     Unless required by applicable law or agreed to in writing, software
 *     distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 */
package com.nicsin.gamedom.presentor.mvc.controller;

import java.util.SortedSet;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nicsin.gamedom.presentor.model.TwitterMessage;
import com.nicsin.gamedom.presentor.model.TwitterMessages;
import com.nicsin.gamedom.presentor.service.TwitterService;
import com.nicsin.gamedom.presentor.support.SortOrder;

/**
 * Handles requests for the application home page.
 *
 * @author NicSin
 * @since  1.0
 *
 */
@Controller
@RequestMapping
public class HomeController {

	private static final Logger LOGGER = Logger.getLogger(HomeController.class);

	@Autowired
	private TwitterService twitterService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value={"/", "/tweets"})
	public String home(Model model, @RequestParam(required=false) Long latestTweetId,
			@RequestParam(defaultValue="DESCENDING", required=false) SortOrder sortOrder) {

		if (latestTweetId == null) {
			latestTweetId = 0L;
		}

		final SortedSet<TwitterMessage> twitterMessages = twitterService.getTwitterMessages(latestTweetId, sortOrder);

		TwitterMessages twitterMessagesWrapper = new TwitterMessages();

		if (twitterMessages == null || twitterMessages.isEmpty()) {
			twitterMessagesWrapper.setLatestTweetId(latestTweetId);
		} else {
			twitterMessagesWrapper.setTwitterMessages(twitterMessages);
		}

		twitterMessagesWrapper.setAdapterRunning(twitterService.isTwitterAdapterRunning());

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug(String.format("Latest Tweet ID: '%s'; Adapter running: %s",
					twitterMessagesWrapper.getLatestTweetId(),
					twitterMessagesWrapper.isAdapterRunning()));
		}

		model.addAttribute("tweets", twitterMessagesWrapper);

		return "home";
	}
}

